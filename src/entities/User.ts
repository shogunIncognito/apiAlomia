import { BaseEntity, Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm'

@Entity('users')
export class User extends BaseEntity {

    @PrimaryGeneratedColumn()
    _id: number

    @Column()
    username: string

    @Column()
    password: string

    @Column()
    role: string

    @Column({
        nullable: true,
        default: null
    })
    image: string

    @CreateDateColumn()
    createdAt: Date

    @UpdateDateColumn()
    updatedAt: Date
}