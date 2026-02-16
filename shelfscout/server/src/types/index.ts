import { Request } from 'express';

export interface AuthenticatedRequest extends Request {
  userId?: string;
  trustScore?: number;
}

export interface PaginationParams {
  page: number;
  limit: number;
}

export interface PaginatedResponse<T> {
  data: T[];
  total: number;
  page: number;
  limit: number;
}

export interface Coordinates {
  lat: number;
  lng: number;
}
