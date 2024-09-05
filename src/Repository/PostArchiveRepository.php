<?php

namespace App\Repository;

use App\Entity\PostArchive;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<PostArchive>
 *
 * @method PostArchive|null find($id, $lockMode = null, $lockVersion = null)
 * @method PostArchive|null findOneBy(array $criteria, array $orderBy = null)
 * @method PostArchive[]    findAll()
 * @method PostArchive[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PostArchiveRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PostArchive::class);
    }

    //    /**
    //     * @return PostArchive[] Returns an array of PostArchive objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('p.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?PostArchive
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
