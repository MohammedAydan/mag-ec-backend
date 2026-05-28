export interface PromotionEvaluationInput {
  subtotalAmount: number;
  currencyCode: string;
  countryCode: string;
  customerId?: string;
  couponCodes?: string[];
}

export interface PromotionApplication {
  promotionId: string;
  key: string;
  name: string;
  rewardType: 'FIXED_AMOUNT' | 'PERCENTAGE' | 'FREE_SHIPPING';
  discountAmount: number;
  freeShipping: boolean;
  source: 'AUTOMATIC' | 'COUPON';
  couponCode?: string;
}

export interface PromotionRejection {
  key: string;
  reason: string;
  couponCode?: string;
}

export interface PromotionEvaluationResult {
  appliedPromotions: PromotionApplication[];
  rejectedPromotions: PromotionRejection[];
  subtotalDiscountAmount: number;
  freeShipping: boolean;
}
