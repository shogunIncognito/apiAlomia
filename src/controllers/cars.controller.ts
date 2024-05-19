import { Request, Response } from "express"
import { Car } from "../entities/Car"
import { brands } from "../constants/const"
import { Transaction } from "../entities/Transaction"

export const getTransactionsByCarId = async (carId: { _id: number }) => {
    return Transaction.findBy({ car: { _id: carId._id } });
}

export const getCars = async (_req: Request, res: Response) => {
    const cars = await Car.find()

    const carsWithTransactions = await Promise.all(cars.map(async (car) => {
        const transactions = await getTransactionsByCarId(car);
        // Aquí realizamos una consulta para obtener las transacciones asociadas a este auto
        return {
            ...car,
            transactions: transactions?.map(transaction => transaction._id) || []
        };
    }));

    return res.json(carsWithTransactions);
}

export const getCar = async (req: Request, res: Response) => {
    const { id } = req.params
    const car = await Car.findOneBy({ _id: parseInt(id) })
    return res.json(car)
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

export const deleteCar = async (req: Request, res: Response) => {
    const { ids } = req.query
    await Car.delete({ _id: parseInt(ids as string) })
    return res.json({ message: 'Car deleted' })
}

// images

export const updateCarImages = async (req: Request, res: Response) => {
    const { id } = req.params
    const { images } = req.body

    const car = await Car.findOneBy({ _id: parseInt(id) })
    if (!car) return res.status(404).json({ message: 'Car not found' })

    const filteredImages = car.images.filter(carImage => !images.includes(carImage))
    car.images = filteredImages

    await car.save()

    return res.json(car)
}

// brands
export const getBrands = (_req: Request, res: Response) => {
    return res.json(brands)
}