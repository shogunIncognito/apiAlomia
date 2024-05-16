import { BaseEntity, Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@Entity('cars')
export class Car extends BaseEntity {
    @PrimaryGeneratedColumn()
    _id: number

    @Column()
    brand: string

    @Column()
    model: number

    @Column()
    line: string

    @Column()
    kilometers: number

    @Column('text', {
        array: true,
        default: []
    })
    images: string[]

    @Column({ type: 'bigint' })
    price: string;

    @Column({
        default: null
    })
    preview: string

    @Column()
    fuel: string

    @Column()
    transmission: string

    @Column('float')
    cc: number

    @Column()
    type: string

    @Column()
    owners: number

    @Column()
    plate: string

    @Column()
    color: string

    @CreateDateColumn()
    createdAt: Date

    @UpdateDateColumn()
    updatedAt: Date
}