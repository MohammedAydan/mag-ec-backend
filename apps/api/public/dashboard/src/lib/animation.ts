import type { Transition, Variants } from 'motion/react';

// Shared transition presets
export const fadeSlideUp: Variants = {
  initial: { opacity: 0, y: 15 },
  animate: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -15 },
};

export const fadeSlideDown: Variants = {
  initial: { opacity: 0, y: -10 },
  animate: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -10 },
};

export const fadeOnly: Variants = {
  initial: { opacity: 0 },
  animate: { opacity: 1 },
  exit: { opacity: 0 },
};

export const slideInRight: Variants = {
  initial: { x: '100%' },
  animate: { x: '0%' },
  exit: { x: '100%' },
};

export const scaleIn: Variants = {
  initial: { opacity: 0, scale: 0.95 },
  animate: { opacity: 1, scale: 1 },
  exit: { opacity: 0, scale: 0.95 },
};

// Shared transition config
export const springTransition: Transition = {
  duration: 0.3,
  ease: 'easeInOut',
};

export const quickTransition: Transition = {
  duration: 0.2,
  ease: 'easeOut',
};
