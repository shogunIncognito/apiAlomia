import { Router } from 'express';
import { login, validateToken } from '../controllers/auth.controller';

const router = Router()

router
    .post('/login', login)
    .post('/validate-token', validateToken)

export default router