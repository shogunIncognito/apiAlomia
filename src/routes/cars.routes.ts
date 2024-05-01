import { Router } from 'express';
import { createCar, getCars, updateCar } from '../controllers/cars.controller';

const router = Router()

router
    .get('/', getCars)
    .post('/', createCar)
    .patch('/:id', updateCar)
    .delete('/:id', () => {})

export default router