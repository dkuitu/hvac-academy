// TODO: Implement User model queries (Knex)
export interface User {
  id: string;
  email: string;
  username: string;
  password_hash: string;
  trust_score: number;
  region_id: string;
  created_at: Date;
  updated_at: Date;
}
