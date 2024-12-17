<?php

namespace App\Repository;

use App\Entity\MealPlanner;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<MealPlanner>
 */
class MealPlannerRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MealPlanner::class);
    }

    public function findByFilters(?string $type, ?int $maxCalories): array
    {
        $queryBuilder = $this->createQueryBuilder('r')
            ->where('r.status = :status')
            ->setParameter('status', true);

        if (!empty($type)) {
            $queryBuilder->andWhere('r.type = :type')
                ->setParameter('type', $type);
        }

        if (!empty($maxCalories) && is_numeric($maxCalories)) {
            $queryBuilder->andWhere('r.calories <= :maxCalories')
                ->setParameter('maxCalories', $maxCalories);
        }

        return $queryBuilder->getQuery()->getResult();
    }

    public function findByFiltersAndUser(?string $type, ?int $maxCalories, User $user): array
    {
        $queryBuilder = $this->createQueryBuilder('r')
            ->where('r.status = :status') // тільки затверджені рецепти
            ->setParameter('status', true)
            ->andWhere('r.author = :author') // додано фільтр за автором
            ->setParameter('author', $user);

        if (!empty($type)) {
            $queryBuilder->andWhere('r.type = :type')
                ->setParameter('type', $type);
        }

        if (!empty($maxCalories) && is_numeric($maxCalories)) {
            $queryBuilder->andWhere('r.calories <= :maxCalories')
                ->setParameter('maxCalories', $maxCalories);
        }

        return $queryBuilder->getQuery()->getResult();
    }

    //    /**
    //     * @return MealPlanner[] Returns an array of MealPlanner objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('m')
    //            ->andWhere('m.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('m.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?MealPlanner
    //    {
    //        return $this->createQueryBuilder('m')
    //            ->andWhere('m.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
