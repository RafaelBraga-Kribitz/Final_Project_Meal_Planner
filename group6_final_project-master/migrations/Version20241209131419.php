<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241209131419 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE meal_planner (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, chosen_date DATETIME NOT NULL, update_date DATETIME DEFAULT NULL, INDEX IDX_ECE2C578A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE meal_planner_recipe (meal_planner_id INT NOT NULL, recipe_id INT NOT NULL, INDEX IDX_73A42DC0C42A5C6B (meal_planner_id), INDEX IDX_73A42DC059D8A214 (recipe_id), PRIMARY KEY(meal_planner_id, recipe_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE recipe (id INT AUTO_INCREMENT NOT NULL, author_id INT NOT NULL, name VARCHAR(255) NOT NULL, ingredients LONGTEXT NOT NULL, description LONGTEXT DEFAULT NULL, photo VARCHAR(255) DEFAULT NULL, cooking_time INT NOT NULL, preparation_time INT NOT NULL, calories INT NOT NULL, link VARCHAR(255) DEFAULT NULL, type VARCHAR(50) NOT NULL, date_added DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', date_updated DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_DA88B137F675F31B (author_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL, photo VARCHAR(255) DEFAULT NULL, phone_number INT DEFAULT NULL, UNIQUE INDEX UNIQ_IDENTIFIER_EMAIL (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE meal_planner ADD CONSTRAINT FK_ECE2C578A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE meal_planner_recipe ADD CONSTRAINT FK_73A42DC0C42A5C6B FOREIGN KEY (meal_planner_id) REFERENCES meal_planner (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE meal_planner_recipe ADD CONSTRAINT FK_73A42DC059D8A214 FOREIGN KEY (recipe_id) REFERENCES recipe (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE recipe ADD CONSTRAINT FK_DA88B137F675F31B FOREIGN KEY (author_id) REFERENCES user (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE meal_planner DROP FOREIGN KEY FK_ECE2C578A76ED395');
        $this->addSql('ALTER TABLE meal_planner_recipe DROP FOREIGN KEY FK_73A42DC0C42A5C6B');
        $this->addSql('ALTER TABLE meal_planner_recipe DROP FOREIGN KEY FK_73A42DC059D8A214');
        $this->addSql('ALTER TABLE recipe DROP FOREIGN KEY FK_DA88B137F675F31B');
        $this->addSql('DROP TABLE meal_planner');
        $this->addSql('DROP TABLE meal_planner_recipe');
        $this->addSql('DROP TABLE recipe');
        $this->addSql('DROP TABLE user');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
