<?php

namespace App\Repository;

use App\Entity\ContactArchive;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ContactArchive>
 *
 * @method ContactArchive|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContactArchive|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContactArchive[]    findAll()
 * @method ContactArchive[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContactArchiveRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContactArchive::class);
    }

    /**
    * @return ContactArchive[] Returns an array of User objects
    */
    public function search($value): array {
        return $this->createQueryBuilder('u')
            // ->join('u.user', 'e')
            ->andWhere('u.description LIKE :val')
            ->orWhere('u.mail LIKE :val')
            ->orWhere('u.title LIKE :val')
            ->orWhere('u.status LIKE :val')
            // ->orWhere('e.username LIKE :val')
            ->setParameter('val', '%'.$value.'%')
            ->orderBy('u.id', 'DESC')
            ->getQuery()
            ->getResult();
        }

        public function findAllDesc()
        {
            return $this->findBy(array(), array('id' => 'DESC'));
        }
    //    /**
    //     * @return ContactArchive[] Returns an array of ContactArchive objects
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

    //    public function findOneBySomeField($value): ?ContactArchive
    //    {
    //        return $this->createQueryBuilder('c')
    //            ->andWhere('c.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
