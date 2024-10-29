<?php

namespace App\Repository;

use App\Entity\Contact;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Contact>
 *
 * @method Contact|null find($id, $lockMode = null, $lockVersion = null)
 * @method Contact|null findOneBy(array $criteria, array $orderBy = null)
 * @method Contact[]    findAll()
 * @method Contact[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContactRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Contact::class);
    }

    
    /**
    * @return Contact[] Returns an array of User objects
    */
    public function search($value): array {
    return $this->createQueryBuilder('u')
        ->join('u.user', 'e')
        ->andWhere('u.description LIKE :val')
        ->orWhere('u.mail LIKE :val')
        ->orWhere('u.title LIKE :val')
        ->orWhere('u.status LIKE :val')
        ->orWhere('e.username LIKE :val')
        ->setParameter('val', '%'.$value.'%')
        ->orderBy('u.id', 'DESC')
        ->getQuery()
        ->getResult();
    }

    public function findAllDesc()
    {
        return $this->findBy(array(), array('id' => 'DESC'));
    } 

    public function findByUser($userId)
    {
        return $this->createQueryBuilder('c')
            ->where('c.user = :userId')
            ->setParameter('userId', $userId)
            ->orderBy('c.id', 'DESC') // Tri par ID en ordre descendant
            ->getQuery()
            ->getResult();
    }

    //    /**
    //     * @return Contact[] Returns an array of Contact objects
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

    //    public function findOneBySomeField($value): ?Contact
    //    {
    //        return $this->createQueryBuilder('c')
    //            ->andWhere('c.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
