// TODO: Implement Item model queries (Knex)
export interface Item {
  id: string;
  name: string;
  category: string;
  active: boolean; // part of this week's rotation
  week_number: number;
  created_at: Date;
}
