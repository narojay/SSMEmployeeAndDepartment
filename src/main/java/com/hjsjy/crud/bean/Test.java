package com.hjsjy.crud.bean;

import java.util.Arrays;

/**
 * 〈一句话功能简述〉<br>
 *
 * @author hjsjy
 * @create 2018/8/15
 * @since 1.0.0
 */
public class Test {
    public static void main(String[] args) {
//        int[] a=new int[10];
//        for (int i = 0; i <10 ; i++) {
//            a[i]=i+1;
//        }
//
//        for (int i = 9; i >0; i--) {
//
//
//        System.out.println(a[i]);
//        }
        System.out.println("use ReverseSelf");
        String[] a={"hj","acc","ddd","ac","qwe"};
        System.out.println(Arrays.toString(a));
        for(int start=0,end=a.length-1;start<end;start++,end--){
            String temp=a[end];
            a[end]=a[start];
            a[start]=temp;
        }
        System.out.println(Arrays.toString(a));

    }
}