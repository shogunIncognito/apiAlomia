import { BaseEntity, Column, CreateDateColumn, Entity, PrimaryColumn, UpdateDateColumn } from 'typeorm'

@Entity('buyers')
export class Buyer extends BaseEntity {
    @PrimaryColumn({ type: 'bigint' })
    cc: number

    @Column()
    name: string

    @Column()
    email: string

    @Column({ type: 'bigint' })
    phone: string;

    @CreateDateColumn()
    createdAt: Date

    @UpdateDateColumn()
    updatedAt: Date
}