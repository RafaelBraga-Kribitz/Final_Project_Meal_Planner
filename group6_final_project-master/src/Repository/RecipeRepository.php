<?php

namespace App\Repository;

use App\Entity\Recipe;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Recipe>
 */
class RecipeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Recipe::class);
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




    //    /**
    //     * @return Recipe[] Returns an array of Recipe objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Recipe
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
