import { DataSource } from "typeorm"
import { User } from "../entities/User"
import { Car } from "../entities/Car"
import { Buyer } from "../entities/Buyer"
import { Transaction } from "../entities/Transaction"

export const AppDataSource = new DataSource({
    type: "postgres",
    host: "localhost",
    database: "maxautos",
    port: 5432,
    username: "postgres",
    password: process.env.DB_PASSWORD,
    entities: [User, Car, Buyer, Transaction],
    logging: true,
    synchronize: true
})