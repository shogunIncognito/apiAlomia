import express from 'express'
import cors from 'cors'
import morgan from 'morgan'
import authRoutes from './routes/auth.routes'
import carsRoutes from './routes/cars.routes'

const app = express()

app.use(morgan('dev'))
app.use(cors())
app.use(express.json())

app.use('/api/auth', authRoutes)
app.use('/api/cars', carsRoutes)

export default app