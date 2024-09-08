import { Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

export const authenticateToken = (req: any, res: Response, next: NextFunction) => {
  const token = req.cookies.token;

  if (token == null) return res.sendStatus(401);

  jwt.verify(token, process.env.JWT_SECRET as string, (err: any, user: any) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
};