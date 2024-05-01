import { Request, Response } from "express"
import { User } from "../entities/User";
import jwt from 'jsonwebtoken'

export const login = async (req: Request, res: Response) => {
    const { username, password } = req.body

    const existUser = await User.findOne({ where: { username } })
    if (!existUser) return res.status(401).json({ message: 'Invalid credentials' })

    if (existUser.password !== password) return res.status(401).json({ message: 'Invalid credentials' })

    const values = {
        _id: existUser._id,
        username: existUser.username,
        role: existUser.role,
        image: existUser.image
    }

    const token = jwt.sign(values, process.env.JWT_SECRET!)

    res.json({ token, ...values })
}