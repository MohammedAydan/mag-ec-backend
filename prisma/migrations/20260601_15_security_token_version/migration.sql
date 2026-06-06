-- Add tokenVersion to invalidate JWTs after privilege/status/password changes.
ALTER TABLE `User` ADD COLUMN `tokenVersion` INT NOT NULL DEFAULT 0;
