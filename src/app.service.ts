import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getFactorization(number): number[] {
    if (number === undefined || number === null) {
      return [];
    }

    let divider = 2;
    const factors = [1];
    if (number === divider) {
      return [...factors, divider];
    }

    while (number > divider) {
      if (number % divider === 0) {
        factors.push(divider);
      }
      divider += 1;
    }

    factors.push(number);
    return factors;
  }
}
