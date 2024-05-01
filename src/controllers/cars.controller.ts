import { Request, Response } from "express"
import { Car } from "../entities/Car"

export const getCars = async (_req: Request, res: Response) => {
    const cars = await Car.find()
    return res.json(cars)
}

export const createCar = async (req: Request, res: Response) => {
    console.log(req.body);
    const car = Car.create(req.body)
    await car.save()
    return res.json(car)
}

export const updateCar = async (req: Request, res: Response) => {
    const { id } = req.params
    const car = await Car.findOneBy({ _id: parseInt(id) })
    if (!car) return res.status(404).json({ message: 'Car not found' })

    Car.merge(car, req.body)
    await car.save()

    return res.json(car)
}