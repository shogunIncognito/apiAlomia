import { Router } from 'express';
import { createCar, deleteCar, getBrands, getCar, getCars, updateCar, updateCarImages } from '../controllers/cars.controller';

const router = Router()

router
    .get('/', getCars)
    .post('/', createCar)
    .delete('/', deleteCar)
    .get('/brands', getBrands)
    .get('/:id', getCar)
    .patch('/:id/images', updateCarImages)
    .patch('/:id', updateCar)

export default router