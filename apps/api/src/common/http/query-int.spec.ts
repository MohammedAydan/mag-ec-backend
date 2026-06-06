import { coercePositiveInt } from './query-int';

describe('coercePositiveInt', () => {
  it('returns a positive integer unchanged', () => {
    expect(coercePositiveInt(12, 5)).toBe(12);
  });

  it('parses positive integer strings', () => {
    expect(coercePositiveInt('25', 5)).toBe(25);
  });

  it('falls back for invalid input', () => {
    expect(coercePositiveInt(undefined, 5)).toBe(5);
    expect(coercePositiveInt('0', 5)).toBe(5);
    expect(coercePositiveInt('abc', 5)).toBe(5);
  });
});
