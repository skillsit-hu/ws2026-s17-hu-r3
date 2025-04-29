SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

CREATE TABLE
  `Machine` (
    `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `locationX` int DEFAULT NULL,
    `locationY` int DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

INSERT INTO
  `Machine` (`id`, `url`, `name`, `locationX`, `locationY`)
VALUES
  (
    'M001',
    'https://module-c-YYYY-wm-1.sudsy.com',
    NULL,
    31,
    31
  ),
  (
    'M002',
    'https://module-c-YYYY-wm-2.sudsy.com',
    NULL,
    264,
    31
  ),
  (
    'M003',
    'https://module-c-YYYY-wm-3.sudsy.com',
    NULL,
    497,
    31
  ),
  (
    'M004',
    'https://module-c-YYYY-wm-4.sudsy.com',
    NULL,
    968,
    31
  );

CREATE TABLE
  `MachineUsage` (
    `id` int NOT NULL,
    `userId` int NOT NULL,
    `machineId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `action` enum ('start', 'stop', 'pause', 'resume') COLLATE utf8mb4_unicode_ci NOT NULL,
    `parameters` json NOT NULL,
    `createdAt` datetime (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  `User` (
    `id` int NOT NULL,
    `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `passwordHash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `credits` int NULL DEFAULT 0,
    `createdAt` datetime (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` datetime (3) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  `UserToken` (
    `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `userId` int NOT NULL,
    `createdAt` datetime (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `revokedAt` datetime (3) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  `WalletTransaction` (
    `id` int NOT NULL,
    `userId` int NOT NULL,
    `credits` int NOT NULL,
    `machineUsageId` int DEFAULT NULL,
    `createdAt` datetime (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE `Machine` ADD PRIMARY KEY (`id`);

ALTER TABLE `MachineUsage` ADD PRIMARY KEY (`id`),
ADD KEY `MachineUsage_userId_fkey` (`userId`),
ADD KEY `MachineUsage_machineId_fkey` (`machineId`);

ALTER TABLE `User` ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `User_email_key` (`email`);

ALTER TABLE `UserToken` ADD PRIMARY KEY (`token`),
ADD KEY `UserToken_userId_fkey` (`userId`);

ALTER TABLE `WalletTransaction` ADD PRIMARY KEY (`id`),
ADD KEY `WalletTransaction_userId_fkey` (`userId`),
ADD KEY `WalletTransaction_machineUsageId_fkey` (`machineUsageId`);

ALTER TABLE `MachineUsage` MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `User` MODIFY `id` int NOT NULL AUTO_INCREMENT,
ALTER TABLE `WalletTransaction` MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `MachineUsage` ADD CONSTRAINT `MachineUsage_machineId_fkey` FOREIGN KEY (`machineId`) REFERENCES `Machine` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT `MachineUsage_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `UserToken` ADD CONSTRAINT `UserToken_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `WalletTransaction` ADD CONSTRAINT `WalletTransaction_machineUsageId_fkey` FOREIGN KEY (`machineUsageId`) REFERENCES `MachineUsage` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `WalletTransaction_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

COMMIT;