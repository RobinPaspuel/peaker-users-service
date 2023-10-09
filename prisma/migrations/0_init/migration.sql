-- CreateEnum
CREATE TYPE "document_t" AS ENUM ('national_id', 'passport');

-- CreateTable
CREATE TABLE "users" (
    "user_id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255),
    "last_name" VARCHAR(255),
    "country" VARCHAR(255),
    "city" VARCHAR(255),
    "postal_code" VARCHAR(255),
    "phone_number" VARCHAR(255),
    "email" VARCHAR(255),
    "secondary_phone_number" VARCHAR(255),
    "secondary_email" VARCHAR(255),
    "profile_picture" VARCHAR(255),
    "document_type" "document_t" NOT NULL,
    "document_url" VARCHAR(255) NOT NULL,
    "reset_password_token" VARCHAR(255),
    "reset_password_token_expiry" DATE,
    "tokens" JSONB[] DEFAULT ARRAY[]::JSONB[],
    "registration_date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "last_login" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "last_modified" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_secondary_email_key" ON "users"("secondary_email");

