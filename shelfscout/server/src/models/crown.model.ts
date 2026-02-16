// TODO: Implement Crown model queries (Knex)
export type CrownStatus = 'active' | 'contested' | 'archived';

export interface Crown {
  id: string;
  item_id: string;
  region_id: string;
  holder_id: string;
  submission_id: string;
  lowest_price: number;
  status: CrownStatus;
  claimed_at: Date;
  week_number: number;
}

export interface CrownTransfer {
  id: string;
  crown_id: string;
  from_user_id: string | null;
  to_user_id: string;
  price: number;
  transferred_at: Date;
}
