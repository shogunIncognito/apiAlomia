import { BaseEntity, Column, CreateDateColumn, Entity, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm'
import { Buyer } from './Buyer'
import { Car } from './Car'

@Entity('transactions')
export class Transaction extends BaseEntity {

    @PrimaryGeneratedColumn()
    _id: number

    @ManyToOne(() => Buyer, buyer => buyer.cc)
    buyer: Buyer

    @ManyToOne(() => Car, car => car._id)
    car: Car

    @Column({ type: 'bigint' })
    price: string;

    @Column()
    date: Date

    @CreateDateColumn()
    createdAt: Date

    @UpdateDateColumn()
    updatedAt: Date
}