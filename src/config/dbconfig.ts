import { DataSource } from "typeorm"
import { User } from "../entities/User"
import { Car } from "../entities/Car"

export const AppDataSource = new DataSource({
    type: "postgres",
    host: "localhost",
    database: "maxautos",
    port: 5432,
    username: "postgres",
    password: "DEV123",
    entities: [User, Car],
    logging: true,
    synchronize: true
})