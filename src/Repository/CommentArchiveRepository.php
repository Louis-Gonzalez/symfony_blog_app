<?php

namespace App\Repository;

use App\Entity\CommentArchive;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<CommentArchive>
 *
 * @method CommentArchive|null find($id, $lockMode = null, $lockVersion = null)
 * @method CommentArchive|null findOneBy(array $criteria, array $orderBy = null)
 * @method CommentArchive[]    findAll()
 * @method CommentArchive[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommentArchiveRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CommentArchive::class);
    }
    
    public function findAllDesc()
    {
        return $this->findBy(array(), array('id' => 'DESC'));
    } 
    //    /**
    //     * @return CommentArchive[] Returns an array of CommentArchive objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('c')
    //            ->andWhere('c.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('c.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?CommentArchive
    //    {
    //        return $this->createQueryBuilder('c')
    //            ->andWhere('c.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
