#include<stdio.h>
#include<stdlib.h>
void roundrobin(int n,int tq,int st[],int bt[]) {
    int time=0;
    int tat[10],wt[10],i,count=0,swt=0,stat=0,temp1,sq=0,j,k;
    float awt=0.0,atat=0.0;
    while(1) {
        for(i=0,count=0;i<n;i++) {
            temp1=tq;
            if(st[i]==0) {
                count++; 
                continue;
            }

            if(st[i]>tq) 
                st[i]=st[i]-tq; 
            else if(st[i]>=0) {
                temp1=st[i]; 
                st[i]=0; 
            }
            sq=sq+temp1; 
            tat[i]=sq; 
        } 
        if(n==count) 
            break;
    } 
    for(i=0;i<n;i++) {
        wt[i]=tat[i]-bt[i]; 
        swt=swt+wt[i]; 
        stat=stat+tat[i]; 
    }
    awt=(float)swt/n; 
    atat=(float)stat/n; 
    printf("Process_no Burst time Wait time Turn around time\n");
    for(i=0;i<n;i++)
        printf("%d\t\t%d\t\t%d\t%d\n",i+1,bt[i],wt[i],tat[i]);
    printf("Avg wait time is %f\nAvg turn around time is %f\n",awt,atat);
}

void srtf(int limit) {
    int arrival_time[10], burst_time[10], temp[10];
    int i, smallest, count = 0, time;
    double wait_time = 0, turnaround_time = 0, end;
    float average_waiting_time, average_turnaround_time;
    printf("\nEnter Details of %d Processes\n", limit);
    for(i = 0; i < limit; i++) {
        printf("\nEnter Arrival Time:\t");
        scanf("%d", &arrival_time[i]);
        printf("Enter Burst Time:\t");
        scanf("%d", &burst_time[i]); 
        temp[i] = burst_time[i];
    }
    burst_time[9] = 9999;  
    for(time = 0; count != limit; time++) {
        smallest = 9;
        for(i = 0; i < limit; i++) {
            if(arrival_time[i] <= time && burst_time[i] < burst_time[smallest] && burst_time[i] > 0) {
                    smallest = i;
            }
        }
        burst_time[smallest]--;
            if(burst_time[smallest] == 0)  {
                count++;
                end = time + 1;
                wait_time = wait_time + end - arrival_time[smallest] - temp[smallest];
                turnaround_time = turnaround_time + end - arrival_time[smallest];
            }
    }
    average_waiting_time = wait_time / limit; 
    average_turnaround_time = turnaround_time / limit;
    printf("\n\nAverage Waiting Time:\t%lf\n", average_waiting_time);
    printf("Average Turnaround Time:\t%lf\n", average_turnaround_time);
      
}

int main(){
    int n,tq,choice;
    int bt[10],st[10],i,j,k;
    for(; ;) {
        printf("Enter the choice\n");
        printf(" 1. Round Robin\n 2. SRT\n 3. Exit\n");
        scanf("%d",&choice);
        switch(choice) {
            case 1: printf("Round Robin scheduling algorithm\n");
                    printf("Enter number of processes:\n");
                    scanf("%d",&n);
                    printf("Enter burst time for sequences:\n");
                    for(i=0;i<n;i++) {
                        scanf("%d",&bt[i]);
                        st[i]=bt[i]; 
                    }
                    printf("Enter time quantum:");
                    scanf("%d",&tq);
                    roundrobin(n,tq,st,bt);
                    break;

            case 2: printf("\n\n---SHORTEST REMAINING TIME NEXT---\n\n ");
                    printf("\n\n Enter the number of processes: ");
                    scanf("%d", &n);
                    srtf(n);
                    break;
            case 3: exit(0);
        }   
    }
}