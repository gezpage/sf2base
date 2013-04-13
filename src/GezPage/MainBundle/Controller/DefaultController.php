<?php

namespace GezPage\MainBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('GezPageMainBundle:Default:index.html.twig', array('name' => $name));
    }
}
