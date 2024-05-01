import { AppDataSource } from './config/dbconfig'
import app from './app'

async function main() {
    try {
        await AppDataSource.initialize()
        console.log('Database connected');
        app.listen(process.env.PORT || 3001, () => console.log('Live in http://localhost:3001/'))
    } catch (error) {
        console.log('Error connecting to the database', error);
    }
}

main()
