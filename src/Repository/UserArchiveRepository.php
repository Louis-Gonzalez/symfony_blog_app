<?php

namespace App\Repository;

use App\Entity\UserArchive;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<UserArchive>
 *
 * @method UserArchive|null find($id, $lockMode = null, $lockVersion = null)
 * @method UserArchive|null findOneBy(array $criteria, array $orderBy = null)
 * @method UserArchive[]    findAll()
 * @method UserArchive[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserArchiveRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UserArchive::class);
    }

    //    /**
    //     * @return UserArchive[] Returns an array of UserArchive objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('u.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?UserArchive
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
