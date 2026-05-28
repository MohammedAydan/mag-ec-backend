export interface MoneyValue {
  amount: number;
  currencyCode: string;
}

export interface TaxComputationInput {
  taxClassId?: string | null;
  countryCode: string;
  subtotalAmount: number;
  currencyCode: string;
}

export interface TaxComputationResult {
  amount: number;
  rateBps: number;
  isIncludedInPrice: boolean;
}

export interface TaxStrategy {
  computeTax(input: TaxComputationInput): Promise<TaxComputationResult>;
}
