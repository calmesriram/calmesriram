pragma solidity ^0.4.0;
contract cal
{
    struct salary
    {
        uint256 emp_id;
        string emp_name;
        string emp_address1;
        string emp_address2;
        uint256 emp_salary;
        uint256 emp_overtime;
        uint256 emp_absent;
        uint256 emp_lop;
        uint256 emp_bonus;
        uint256  emp_annum;
    }
    mapping(address => salary)singlemap;
    mapping(address => salary)calmap;
    function General(address reg,uint256 id,string name,string address1,string address2)public
    {
        singlemap[reg].emp_id = id;
        singlemap[reg].emp_name = name;
        singlemap[reg].emp_address1 =address1;
        singlemap[reg].emp_address2 = address2;
    }
    function Sal_cal(uint256 sal,uint256 absent,uint256 bonus)public //returns(uint256,uint256)
    {  address reg;
      
       if(absent ==0)
       {
        calmap[reg].emp_salary = sal+bonus;
        calmap[reg].emp_id = singlemap[reg].emp_id;
       }
       else
       {
           calmap[reg].emp_salary = sal+bonus;
           calmap[reg].emp_lop = absent *(calmap[reg].emp_salary/30);
            calmap[reg].emp_salary =  (calmap[reg].emp_salary - calmap[reg].emp_lop);
            calmap[reg].emp_id = singlemap[reg].emp_id;
       }
        //return(calmap[reg].emp_salary,calmap[reg].emp_id);
    }
    function outup(address reg)public view returns(uint256,string,string,string,uint256,uint256,uint256)
    {
        return (singlemap[reg].emp_id,singlemap[reg].emp_name,singlemap[reg].emp_address1,singlemap[reg].emp_address2,calmap[reg].emp_salary,calmap[reg].emp_lop,calmap[reg].emp_id);
    }
}
