// TODO: Implement Submission model queries (Knex)
export type SubmissionStatus = 'pending' | 'verified' | 'rejected';

export interface Submission {
  id: string;
  user_id: string;
  store_id: string;
  item_id: string;
  price: number;
  photo_url: string;
  status: SubmissionStatus;
  ocr_extracted_price?: number;
  gps_lat: number;
  gps_lng: number;
  submitted_at: Date;
  verified_at?: Date;
  week_number: number;
}
