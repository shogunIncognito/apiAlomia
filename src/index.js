import express from 'express'
import cors from 'cors'
import morgan from 'morgan'
import authRoutes from './routes/auth.routes.js'

const app = express()

app.use(morgan('dev'))
app.use(cors())

app.get('/', (req, res) => {
    res.json({
        message: 'Hello World! this is the maxautos rest api'
    })
})

app.use('/auth', authRoutes)

app.listen(3001, () => console.log('Live in http://localhost:3001/'))