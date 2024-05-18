import { Request, Response } from "express"
import { Transaction } from "../entities/Transaction"
import { Buyer } from "../entities/Buyer"

export const getTransaction = async (_req: Request, res: Response) => {
    const transactions = await Transaction.find({ relations: ['buyer', 'car'] })
    return res.json(transactions)
}

export const createTransaction = async (req: Request, res: Response) => {
    const { buyer, car, price, date } = req.body

    // busca si el comprador ya existe y si no lo crea
    const existBuyer = await Buyer.findOneBy({ cc: buyer.cc })
    const newBuyer = existBuyer || await Buyer.save(buyer)

    const newTransaction = await Transaction.save({ buyer: newBuyer.cc, car, price, date })
    return res.json(newTransaction)
}