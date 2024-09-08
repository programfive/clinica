import express from 'express';
import path from 'path';
import { register, login, logout } from '../controller/authController';
import { authenticateToken } from '../middleware/auth';

const router = express.Router();

router.get('/login', (req, res) => {
  res.sendFile(path.join(__dirname, '../views/login.html'));
});

router.get('/register', (req, res) => {
  res.sendFile(path.join(__dirname, '../views/register.html'));
});

router.post('/register', register);
router.post('/login', login);
router.post('/logout', logout);

router.get('/dashboard', authenticateToken, (req, res) => {
  res.sendFile(path.join(__dirname, '../views/dashboard.html'));
});

export default router;