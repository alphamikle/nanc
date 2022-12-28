import fs from 'fs';
import path from 'path';

export const extTypeMap = {
  '.png': 'image/png',
  '.gif': 'image/gif',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.bm': 'image/bmp',
  '.bmp': 'image/bmp',
  '.webp': 'image/webp',
  '.ico': 'image/x-icon',
  '.svg': 'image/svg+xml'
}

export type ExtType = '.png'
  | '.gif'
  | '.jpg'
  | '.jpeg'
  | '.bm'
  | '.bmp'
  | '.webp'
  | '.ico'
  | '.svg';

export default function image2uri(file: string) {
  const image = fs.readFileSync(file)
  const ext = path.extname(file) as ExtType;
  const contentType = extTypeMap[ext] || 'image/jpeg'
  return `data:${contentType};base64,${image.toString('base64')}`
}