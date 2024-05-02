import { Router } from 'express';
import { createCar, deleteCar, getBrands, getCars, updateCar, updateCarImages } from '../controllers/cars.controller';

const router = Router()

router
    .get('/', getCars)
    .post('/', createCar)
    .patch('/:id', updateCar)
    .delete('/', deleteCar)
    .patch('/:id/images', updateCarImages)
    .get('/brands', getBrands)

export default router