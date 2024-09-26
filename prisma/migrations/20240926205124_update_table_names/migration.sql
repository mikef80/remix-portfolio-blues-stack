/*
  Warnings:

  - You are about to drop the `Note` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Password` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Note" DROP CONSTRAINT "Note_userId_fkey";

-- DropForeignKey
ALTER TABLE "Password" DROP CONSTRAINT "Password_userId_fkey";

-- DropTable
DROP TABLE "Note";

-- DropTable
DROP TABLE "Password";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "password" (
    "hash" TEXT NOT NULL,
    "userId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "note" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "note_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "password_userId_key" ON "password"("userId");

-- AddForeignKey
ALTER TABLE "password" ADD CONSTRAINT "password_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "note" ADD CONSTRAINT "note_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
