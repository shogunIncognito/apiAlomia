import { Router } from 'express';
import { login } from '../services/auth.service.js';

const router = Router()

router.post('/login', login)


export default router