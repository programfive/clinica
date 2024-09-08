import pool from '../config/database';
import bcrypt from 'bcrypt';

export interface User {
  id?: number;
  username: string;
  password: string;
}

export const createUser = async (user: User): Promise<User> => {
  const hashedPassword = await bcrypt.hash(user.password, 10);
  const [result] = await pool.execute(
    'INSERT INTO users (username, password) VALUES (?, ?)',
    [user.username, hashedPassword]
  );
  return { id: (result as any).insertId, ...user };
};

export const findUserByUsername = async (username: string): Promise<User | null> => {
  const [rows] = await pool.execute('SELECT * FROM users WHERE username = ?', [username]);
  return (rows as User[])[0] || null;
};