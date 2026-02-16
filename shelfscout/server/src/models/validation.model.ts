// TODO: Implement Validation model queries (Knex)
export type ValidationVote = 'confirm' | 'flag';

export interface Validation {
  id: string;
  submission_id: string;
  validator_id: string;
  vote: ValidationVote;
  reason?: string;
  created_at: Date;
}
