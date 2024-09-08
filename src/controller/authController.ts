import { Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import { createUser, findUserByUsername, User } from '../models/userModel';

export const register = async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;
    const existingUser = await findUserByUsername(username);
    if (existingUser) {
      return res.status(400).json({ message: 'El nombre de usuario ya esta en uso.' });
    }
    const user = await createUser({ username, password });
    res.status(201).json({ message: 'User created successfully', userId: user.id });
  } catch (error) {
    res.status(500).json({ message: 'Error registering user' });
  }
};

export const login = async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;
    const user = await findUserByUsername(username);
    if (!user || !(await bcrypt.compare(password, user.password))) {
      return res.status(401).json({ message: 'Credenciales invalidas' });
    }
    const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET!, { expiresIn: '1h' });
    res.cookie('token', token, { httpOnly: true, maxAge: 3600000 }); // 1 hour
    res.json({ message: 'Logged in successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error logging in' });
  }
};

export const logout = (req: Request, res: Response) => {
  res.clearCookie('token');
  res.json({ message: 'Logged out successfully' });
};