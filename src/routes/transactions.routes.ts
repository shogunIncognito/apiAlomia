import { Router } from 'express';
import { createTransaction, getTransaction } from '../controllers/transactions.controller';

const router = Router()

router
    .get('/', getTransaction)
    .post('/', createTransaction)

export default router