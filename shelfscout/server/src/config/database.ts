import knex from 'knex';
import config from '../../knexfile';
import { env } from './environment';

const environment = env.NODE_ENV as 'development' | 'production';
const db = knex(config[environment]);

export default db;
