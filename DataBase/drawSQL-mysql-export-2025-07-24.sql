CREATE TABLE `Reviews`(
    `listing_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `review_id` BIGINT NOT NULL,
    `date` DATE NOT NULL,
    `reviewer_id` BIGINT NOT NULL
);
CREATE TABLE `Host_Information`(
    `host_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `host_since` DATE NOT NULL,
    `host_location` MEDIUMTEXT NOT NULL,
    `host_reponse_time` TIME NOT NULL,
    `host_response_rate` DECIMAL(8, 2) NOT NULL,
    `host_acceptance_rate` DECIMAL(8, 2) NOT NULL,
    `host_is_superhost` BOOLEAN NOT NULL,
    `host_total_listings_count` BIGINT NOT NULL,
    `host_has_profile_pic` BOOLEAN NOT NULL,
    `host_identity_verified` BOOLEAN NOT NULL
);
CREATE TABLE `Listing_Location`(
    `location_id` BIGINT NOT NULL,
    `neighbourhood` MEDIUMTEXT NOT NULL,
    `city` TEXT NOT NULL,
    `latitude` DECIMAL(8, 2) NOT NULL,
    `longitude` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY(`location_id`)
);
CREATE TABLE `Listings`(
    `listing_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `host_id` BIGINT NOT NULL,
    `location_id` BIGINT NOT NULL,
    `property_type` MEDIUMTEXT NOT NULL,
    `room_type` MEDIUMTEXT NOT NULL,
    `accommodates` BIGINT NOT NULL,
    `bedrooms` BIGINT NOT NULL,
    `amenities` LONGTEXT NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `minimum_nights` BIGINT NOT NULL,
    `maximum_nights` BIGINT NOT NULL,
    `instant_bookable` BOOLEAN NOT NULL
);
CREATE TABLE `Listing_Review_Scores`(
    `listing_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `review_scores_rating` BIGINT NOT NULL,
    `review_scores_accuracy` BIGINT NOT NULL,
    `review_scores_cleanliness` BIGINT NOT NULL,
    `review_scores__checkin` BIGINT NOT NULL,
    `review_scores_location` BIGINT NOT NULL,
    `review_scores_values` BIGINT NOT NULL
);
ALTER TABLE
    `Listing_Review_Scores` ADD CONSTRAINT `listing_review_scores_listing_id_foreign` FOREIGN KEY(`listing_id`) REFERENCES `Listings`(`listing_id`);
ALTER TABLE
    `Listings` ADD CONSTRAINT `listings_host_id_foreign` FOREIGN KEY(`host_id`) REFERENCES `Host_Information`(`host_id`);
ALTER TABLE
    `Reviews` ADD CONSTRAINT `reviews_listing_id_foreign` FOREIGN KEY(`listing_id`) REFERENCES `Listings`(`listing_id`);
ALTER TABLE
    `Listings` ADD CONSTRAINT `listings_property_type_foreign` FOREIGN KEY(`property_type`) REFERENCES `Listing_Location`(`location_id`);