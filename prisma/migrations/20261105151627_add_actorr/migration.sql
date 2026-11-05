/*
  Warnings:

  - You are about to drop the column `filmId` on the `Actor` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Actor" DROP CONSTRAINT "Actor_filmId_fkey";

-- AlterTable
ALTER TABLE "Actor" DROP COLUMN "filmId";

-- CreateTable
CREATE TABLE "_ActorToFilm" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ActorToFilm_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ActorToFilm_B_index" ON "_ActorToFilm"("B");

-- AddForeignKey
ALTER TABLE "_ActorToFilm" ADD CONSTRAINT "_ActorToFilm_A_fkey" FOREIGN KEY ("A") REFERENCES "Actor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ActorToFilm" ADD CONSTRAINT "_ActorToFilm_B_fkey" FOREIGN KEY ("B") REFERENCES "Film"("id") ON DELETE CASCADE ON UPDATE CASCADE;
