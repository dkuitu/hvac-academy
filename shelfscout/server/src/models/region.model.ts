// TODO: Implement Region model queries (Knex + PostGIS)
export interface Region {
  id: string;
  name: string;
  country: string;
  boundary: string; // PostGIS POLYGON geometry
  created_at: Date;
}
