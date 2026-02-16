// TODO: Implement Store model queries (Knex + PostGIS)
export interface Store {
  id: string;
  name: string;
  address: string;
  location: string; // PostGIS POINT geometry
  region_id: string;
  chain?: string;
  created_at: Date;
}
